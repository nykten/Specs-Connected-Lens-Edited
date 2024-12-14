if (script.onAwake) {
	script.onAwake();
	return;
};
function checkUndefined(property, showIfData){
   for (var i = 0; i < showIfData.length; i++){
       if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]){
           return;
       }
   }
   if (script[property] == undefined){
      throw new Error('Input ' + property + ' was not provided for the object ' + script.getSceneObject().name);
   }
}
// @input TutorialInput tutorialNotificationInput
checkUndefined("tutorialNotificationInput", []);
// @input ProgressBarInput mappingProgressInput
checkUndefined("mappingProgressInput", []);
// @input ProgressBarParametersInput progressBarParametersInput
checkUndefined("progressBarParametersInput", []);
// @input TextMappingHintInput textMappingHintInput
checkUndefined("textMappingHintInput", []);
// @input TextMappingHintParametersInput textMappingHintTimingsInput
checkUndefined("textMappingHintTimingsInput", []);
// @input TutorialParametersInput tutorialParametersInput
checkUndefined("tutorialParametersInput", []);
var scriptPrototype = Object.getPrototypeOf(script);
if (!global.BaseScriptComponent){
   function BaseScriptComponent(){}
   global.BaseScriptComponent = BaseScriptComponent;
   global.BaseScriptComponent.prototype = scriptPrototype;
   global.BaseScriptComponent.prototype.__initialize = function(){};
   global.BaseScriptComponent.getTypeName = function(){
       throw new Error("Cannot get type name from the class, not decorated with @component");
   }
}
var Module = require("../../../../../../../../Modules/Src/Src/SpectaclesSyncFramework/ConnectedLens/Mapping/src/MappingFlowStates/MappingState/MappingStateInput");
Object.setPrototypeOf(script, Module.MappingStateInput.prototype);
script.__initialize();
if (script.onAwake) {
   script.onAwake();
}