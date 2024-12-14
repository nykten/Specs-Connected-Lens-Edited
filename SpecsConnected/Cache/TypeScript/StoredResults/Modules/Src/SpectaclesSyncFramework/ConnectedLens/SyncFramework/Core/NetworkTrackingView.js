"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.NetworkTrackingView = void 0;
var __selfType = requireType("./NetworkTrackingView");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let NetworkTrackingView = class NetworkTrackingView extends BaseScriptComponent {
    onAwake() {
        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
    }
    onUpdate() {
        this.updateMessageText();
    }
    updateMessageText() {
        let totalDataStoreChanges = this.networkTracking.getTotalDataStoreChanges();
        let maxFrameDataStoreChanges = this.networkTracking.getMaxFrameDataStoreChanges();
        let averageFrameDataStoreChanges = this.networkTracking.getAverageFrameDataStoreChanges();
        let totalMessages = this.networkTracking.getTotalMessages();
        let averageLatency = Math.round(this.networkTracking.getAverageLatency() * 1000);
        this.messageText.text = `(last second)\nTotal data store changes: ${totalDataStoreChanges}\nMax data store changes: ${maxFrameDataStoreChanges}\nAverage data store changes: ${averageFrameDataStoreChanges}\n Total messages: ${totalMessages}\n Average Latency: ${averageLatency}ms`;
    }
    __initialize() {
        super.__initialize();
    }
};
exports.NetworkTrackingView = NetworkTrackingView;
exports.NetworkTrackingView = NetworkTrackingView = __decorate([
    component
], NetworkTrackingView);
//# sourceMappingURL=NetworkTrackingView.js.map