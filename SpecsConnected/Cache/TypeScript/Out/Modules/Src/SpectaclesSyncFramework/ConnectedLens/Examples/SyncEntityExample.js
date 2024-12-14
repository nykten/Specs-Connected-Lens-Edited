"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var NewScript_1;
Object.defineProperty(exports, "__esModule", { value: true });
exports.NewScript = void 0;
var __selfType = requireType("./SyncEntityExample");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SyncFrameworkLogger_1 = require("../Utils/SyncFrameworkLogger");
let NewScript = NewScript_1 = class NewScript extends BaseScriptComponent {
    onAwake() {
        let syncEntity = new SyncEntity(this, null, true);
        syncEntity.notifyOnReady(this.onReady.bind(this));
    }
    onReady() {
        this.log.i("Example Component: The sync entity is ready!");
    }
    __initialize() {
        super.__initialize();
        this.log = new SyncFrameworkLogger_1.SyncFrameworkLogger(NewScript_1.name);
    }
};
exports.NewScript = NewScript;
exports.NewScript = NewScript = NewScript_1 = __decorate([
    component
], NewScript);
//# sourceMappingURL=SyncEntityExample.js.map