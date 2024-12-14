"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SyncFrameworkLogger = void 0;
const NativeLogger_1 = require("../../SpectaclesInteractionKit/Utils/NativeLogger");
class SyncFrameworkLogger {
    constructor(tag, useNative) {
        this.sessionController = global.sessionController;
        this.nativeLogger = new NativeLogger_1.default(tag);
    }
    i(message) {
        if (!this.sessionController.getDebugLogging()) {
            return;
        }
        this.nativeLogger.i(message);
    }
    d(message) {
        if (!this.sessionController.getDebugLogging()) {
            return;
        }
        this.nativeLogger.d(message);
    }
    e(message) {
        if (!this.sessionController.getDebugLogging()) {
            return;
        }
        this.nativeLogger.e(message);
    }
    w(message) {
        if (!this.sessionController.getDebugLogging()) {
            return;
        }
        this.nativeLogger.w(message);
    }
    v(message) {
        if (!this.sessionController.getDebugLogging()) {
            return;
        }
        this.nativeLogger.v(message);
    }
}
exports.SyncFrameworkLogger = SyncFrameworkLogger;
//# sourceMappingURL=SyncFrameworkLogger.js.map