"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.NetworkTrackingFrame = exports.NetworkTracking = void 0;
var __selfType = requireType("./NetworkTracking");
function component(target) { target.getTypeName = function () { return __selfType; }; }
// How much history to keep in seconds
const MAX_FRAME_HISTORY_SECONDS = 1;
// How often to run the latency test
const LATENCY_TEST_FREQUENCY_SECONDS = 1;
const LATENCY_TEST_EVENT_NAME = "LatencyPing";
let NetworkTracking = class NetworkTracking extends BaseScriptComponent {
    onAwake() {
        this.syncEntity.notifyOnReady(() => {
            this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
            this.syncEntity.onRemoteEventReceived.add(LATENCY_TEST_EVENT_NAME, this.onLatencyPing.bind(this));
        });
    }
    onUpdate() {
        this.clearOldFrames();
        if (getTime() - this.lastLatencyTestTime > LATENCY_TEST_FREQUENCY_SECONDS) {
            this.lastLatencyTestTime = getTime();
            this.sendLatencyPing();
        }
    }
    sendLatencyPing() {
        const currentServerTime = global.sessionController.getServerTimeInSeconds();
        this.syncEntity.sendEvent(LATENCY_TEST_EVENT_NAME, {
            serverTime: currentServerTime,
        });
    }
    onLatencyPing(message) {
        const sentServerTime = message.data.serverTime;
        const senderId = message.senderConnectionId;
        const currentServerTime = global.sessionController.getServerTimeInSeconds();
        const latency = currentServerTime - sentServerTime;
        this.mostRecentLatency.set(senderId, latency);
    }
    getAllLatencies() {
        return this.mostRecentLatency;
    }
    getLatency(connectionId) {
        return this.mostRecentLatency.get(connectionId);
    }
    getAverageLatency() {
        let totalLatency = 0;
        let totalConnections = 0;
        for (let [_, latency] of this.mostRecentLatency) {
            totalLatency += latency;
            totalConnections++;
        }
        if (totalConnections === 0) {
            return 0;
        }
        return totalLatency / this.mostRecentLatency.size;
    }
    clearOldFrames() {
        let currentTime = getTime();
        for (let [frameTime, _] of this.frameHistory) {
            if (currentTime - frameTime > MAX_FRAME_HISTORY_SECONDS) {
                this.frameHistory.delete(frameTime);
            }
        }
    }
    getCurrentFrame() {
        let currentFrameTime = getTime();
        if (!this.frameHistory.has(currentFrameTime)) {
            this.frameHistory.set(currentFrameTime, new NetworkTrackingFrame());
        }
        return this.frameHistory.get(currentFrameTime);
    }
    addDataStoreChange(dataStoreName) {
        let currentNetworkTrackingFrame = this.getCurrentFrame();
        currentNetworkTrackingFrame.addDataStoreChange(dataStoreName);
    }
    addMessage(messageName) {
        let currentNetworkTrackingFrame = this.getCurrentFrame();
        currentNetworkTrackingFrame.addMessage(messageName);
    }
    getAverageFrameMessages() {
        return this.getTotalMessages() / this.frameHistory.size;
    }
    getMinFrameMessages() {
        let minMessages = Number.MAX_VALUE;
        for (let frame of this.frameHistory.values()) {
            let messageCount = frame.messageCount;
            if (messageCount < minMessages) {
                minMessages = messageCount;
            }
        }
        return minMessages;
    }
    getMaxFrameMessages() {
        let maxMessages = 0;
        for (let frame of this.frameHistory.values()) {
            let messageCount = frame.messageCount;
            if (messageCount > maxMessages) {
                maxMessages = messageCount;
            }
        }
        return maxMessages;
    }
    getTotalMessages() {
        let totalMessages = 0;
        for (let frame of this.frameHistory.values()) {
            totalMessages += frame.messageCount;
        }
        return totalMessages;
    }
    getAverageFrameDataStoreChanges() {
        return this.getTotalDataStoreChanges() / this.frameHistory.size;
    }
    getMinFrameDataStoreChanges() {
        let minDataStoreChanges = Number.MAX_VALUE;
        for (let frame of this.frameHistory.values()) {
            let dataStoreChangeCount = frame.dataStoreChangeCount;
            if (dataStoreChangeCount < minDataStoreChanges) {
                minDataStoreChanges = dataStoreChangeCount;
            }
        }
        return minDataStoreChanges;
    }
    getMaxFrameDataStoreChanges() {
        let maxDataStoreChanges = 0;
        for (let frame of this.frameHistory.values()) {
            let dataStoreChangeCount = frame.dataStoreChangeCount;
            if (dataStoreChangeCount > maxDataStoreChanges) {
                maxDataStoreChanges = dataStoreChangeCount;
            }
        }
        return maxDataStoreChanges;
    }
    getTotalDataStoreChanges() {
        let totalDataStoreChanges = 0;
        for (let frame of this.frameHistory.values()) {
            totalDataStoreChanges += frame.dataStoreChangeCount;
        }
        return totalDataStoreChanges;
    }
    __initialize() {
        super.__initialize();
        this.frameHistory = new Map();
        this.lastLatencyTestTime = 0;
        this.mostRecentLatency = new Map();
        this.syncEntity = new SyncEntity(this);
        // Disable NetworkTracking if debug logging is disabled
        if (global.sessionController.getDebugLogging() === false) {
            this.enabled = false;
        }
        globalThis.NetworkTracking = this;
    }
};
exports.NetworkTracking = NetworkTracking;
exports.NetworkTracking = NetworkTracking = __decorate([
    component
], NetworkTracking);
class NetworkTrackingFrame {
    constructor() {
        this.messages = new Map();
        this.dataStoresChanges = new Map();
        this.dataStoreChangeCount = 0;
        this.messageCount = 0;
    }
    addDataStoreChange(dataStoreName) {
        var _a;
        let currentCount = (_a = this.dataStoresChanges.get(dataStoreName)) !== null && _a !== void 0 ? _a : 0;
        this.dataStoresChanges.set(dataStoreName, currentCount + 1);
        this.dataStoreChangeCount++;
    }
    addMessage(messageName) {
        var _a;
        let currentCount = (_a = this.messages.get(messageName)) !== null && _a !== void 0 ? _a : 0;
        this.messages.set(messageName, currentCount + 1);
        this.messageCount++;
    }
}
exports.NetworkTrackingFrame = NetworkTrackingFrame;
//# sourceMappingURL=NetworkTracking.js.map