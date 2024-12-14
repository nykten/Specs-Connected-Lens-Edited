"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.JoiningController = void 0;
const BufferState_1 = require("../MappingFlowStates/BufferState/BufferState");
const JoiningState_1 = require("../MappingFlowStates/JoiningState/JoiningState");
const MappingState_1 = require("../MappingFlowStates/MappingState/MappingState");
const TeachingJoinedUserState_1 = require("../MappingFlowStates/TeachingJoinedUserState/TeachingJoinedUserState");
const WaitingForMappingState_1 = require("../MappingFlowStates/WaitingForMappingState/WaitingForMappingState");
const MessageTextsEnum_1 = require("../Texts/MessageTextsEnum");
class JoiningController {
    constructor(script, stateMachine, projectContainer) {
        this.script = script;
        this.stateMachine = stateMachine;
        this.projectContainer = projectContainer;
    }
    startJoiningFlow() {
        if (global.sessionController.getMapExists()) {
            this.stateMachine.enterState(JoiningState_1.JoiningState.name);
        }
        else {
            this.stateMachine.enterState(WaitingForMappingState_1.WaitingForMappingState.name);
            global.sessionController.notifyOnMapExists(() => {
                if (!global.sessionController.getIsUserMapper()) {
                    this.stateMachine.enterState(JoiningState_1.JoiningState.name);
                }
            });
        }
        global.sessionController.onHostUpdated.add((session, hostUser) => {
            if (this.stateMachine.currentState.name === WaitingForMappingState_1.WaitingForMappingState.name &&
                global.sessionController.isHost()) {
                this.stateMachine.enterState(MappingState_1.MappingState.name);
            }
        });
    }
    startEventsMonitoring() {
        global.sessionController.onUserJoinedSession.add((session, userInfo) => {
            this.projectContainer.joinedUsers.push(userInfo);
            this.projectContainer.isUserAligned.set(false);
            if (this.projectContainer.joinedUsers.length === 1) {
                this.projectContainer.userToHelpChanged();
            }
            if (this.projectContainer.isMappedObservable.value) {
                if (this.stateMachine.currentState.name !== TeachingJoinedUserState_1.TeachingJoinedUserState.name) {
                    this.stateMachine.enterState(TeachingJoinedUserState_1.TeachingJoinedUserState.name);
                }
            }
            else {
                this.projectContainer.isMappedObservable.onChanged.add(() => {
                    if (this.projectContainer.joinedUsers.length > 0) {
                        this.stateMachine.enterState(TeachingJoinedUserState_1.TeachingJoinedUserState.name);
                    }
                });
            }
        });
        global.sessionController.onMessageReceived.add((session, userId, message, senderInfo) => {
            const index = this.getUserInfoIndex(senderInfo);
            if (index > -1 && message === MessageTextsEnum_1.MessageTextsEnum.USER_ALIGNED) {
                this.projectContainer.joinedUsers.splice(index, 1);
                if (this.projectContainer.joinedUsers.length === 0) {
                    this.projectContainer.isUserAligned.set(true);
                    if (this.stateMachine.currentState.name ===
                        TeachingJoinedUserState_1.TeachingJoinedUserState.name) {
                        this.stateMachine.enterState(BufferState_1.BufferState.name);
                    }
                }
                else if (index === 0) {
                    this.projectContainer.userToHelpChanged();
                }
            }
        });
        global.sessionController.onUserLeftSession.add((session, userInfo) => {
            const index = this.getUserInfoIndex(userInfo);
            if (index > -1) {
                this.projectContainer.joinedUsers.splice(index, 1);
                if (this.projectContainer.joinedUsers.length === 0) {
                    this.projectContainer.isUserAligned.set(true);
                    if (this.stateMachine.currentState.name === TeachingJoinedUserState_1.TeachingJoinedUserState.name) {
                        this.stateMachine.enterState(BufferState_1.BufferState.name);
                    }
                }
                else if (index === 0) {
                    this.projectContainer.userToHelpChanged();
                }
            }
        });
    }
    getUserInfoIndex(userInfo) {
        for (let i = 0; i < this.projectContainer.joinedUsers.length; ++i) {
            if (this.projectContainer.joinedUsers[i].connectionId ===
                userInfo.connectionId) {
                return i;
            }
        }
        return -1;
    }
}
exports.JoiningController = JoiningController;
//# sourceMappingURL=JoiningController.js.map