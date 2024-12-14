"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.MappingUnsuccessfulState = void 0;
const MappingUnsuccessfulNotification_1 = require("../../UI/MappingUnsuccessful/MappingUnsuccessfulNotification");
const MappingUnsuccessfulTypeEnum_1 = require("./MappingUnsuccessfulTypeEnum");
class MappingUnsuccessfulState {
    constructor(input, stateMachine, projectContainer) {
        this.input = input;
        this.projectContainer = projectContainer;
        this.mappingUnsuccessfulNotification = new MappingUnsuccessfulNotification_1.MappingUnsuccessfulNotification(input.mappingUnsuccessfulNotification, stateMachine, projectContainer);
        this.alignUnsuccessfulNotification = new MappingUnsuccessfulNotification_1.MappingUnsuccessfulNotification(input.alignUnsuccessfulNotification, stateMachine, projectContainer);
    }
    enter() {
        if (global.sessionController.getIsUserMapper()) {
            this.mappingUnsuccessfulNotification.start(MappingUnsuccessfulTypeEnum_1.MappingUnsuccessfulTypeEnum.Scan);
        }
        else {
            this.alignUnsuccessfulNotification.start(MappingUnsuccessfulTypeEnum_1.MappingUnsuccessfulTypeEnum.Align);
        }
    }
    exit() {
        this.mappingUnsuccessfulNotification.stop();
        this.alignUnsuccessfulNotification.stop();
    }
}
exports.MappingUnsuccessfulState = MappingUnsuccessfulState;
//# sourceMappingURL=MappingUnsuccessfulState.js.map