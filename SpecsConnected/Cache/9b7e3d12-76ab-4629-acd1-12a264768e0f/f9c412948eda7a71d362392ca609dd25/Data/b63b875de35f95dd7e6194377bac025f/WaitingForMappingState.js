"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.WaitingForMappingState = void 0;
const TextValues_1 = require("../../Texts/TextValues");
class WaitingForMappingState {
    constructor(input, stateMashine) {
        this.input = input;
        input.root.enabled = false;
    }
    enter() {
        this.input.waitingText.text = TextValues_1.TextValues.WAITING_FOR_MAPPING.replace(TextValues_1.TextValues.P1, global.sessionController.getHostUserName());
        this.input.root.enabled = true;
    }
    exit() {
        this.input.root.enabled = false;
    }
}
exports.WaitingForMappingState = WaitingForMappingState;
//# sourceMappingURL=WaitingForMappingState.js.map