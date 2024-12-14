"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.StartMenu = void 0;
var __selfType = requireType("./StartMenu");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const NativeLogger_1 = require("../SpectaclesInteractionKit/Utils/NativeLogger");
let StartMenu = class StartMenu extends BaseScriptComponent {
    onAwake() {
        this.createEvent("OnStartEvent").bind(this.onStart.bind(this));
        // Re-enable the start menu if the connection fails
        global.sessionController.onConnectionFailed.add(() => {
            this.getSceneObject().enabled = true;
        });
        // Skip the start menu if the lens was launched directly as multiplayer
        this.checkIfStartedAsMultiplayer();
    }
    onStart() {
        this.singlePlayerButton.onButtonPinched.add(this.onSinglePlayerPress.bind(this));
        this.multiPlayerButton.onButtonPinched.add(this.startMultiplayerSession.bind(this));
    }
    /**
     * If the systemUI has requested that the lens launch directly into multiplayer mode,
     * immediately dismiss this menu and initialize the sync framework.
     */
    checkIfStartedAsMultiplayer() {
        const shouldStartMultiplayer = global.launchParams.getBool("StartMultiplayer");
        this.nativeLogger.i(`Lens started as multiplayer: ${shouldStartMultiplayer}`);
        if (shouldStartMultiplayer) {
            this.startMultiplayerSession();
        }
    }
    /**
     * Start the game in single player mode by hiding this menu.
     */
    onSinglePlayerPress() {
        switch (this.singlePlayerType) {
            case "manual":
            default:
                this.enableOnSingleplayerNodes.forEach((node) => {
                    node.enabled = true;
                });
                this.getSceneObject().enabled = false;
                break;
            case "mocked_online":
                global.sessionController.prepareOfflineMode();
                this.enableOnSingleplayerNodes.forEach((node) => {
                    node.enabled = true;
                });
                this.startMultiplayerSession();
                break;
        }
    }
    /**
     * Start the session by initializing the sync framework, and hiding this menu.
     */
    startMultiplayerSession() {
        this.nativeLogger.i("Starting session");
        this.getSceneObject().enabled = false;
        global.sessionController.init();
    }
    __initialize() {
        super.__initialize();
        this.nativeLogger = new NativeLogger_1.default("StartMenu");
    }
};
exports.StartMenu = StartMenu;
exports.StartMenu = StartMenu = __decorate([
    component
], StartMenu);
//# sourceMappingURL=StartMenu.js.map