// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var UtilityFunctions = {                                                               
  //Enables the submit button in the clinical notes form
  enableSubmit:  function() {
    document.forms[0].commit.disabled=false;
  }
}



Ajax.Responders.register({
  onCreate: function() {
    if($('busy') && Ajax.activeRequestCount>0)
      Effect.Appear('busy',{duration:0.5,queue:'end'});
  },
  onComplete: function() {
    if($('busy') && Ajax.activeRequestCount==0)
      Effect.Fade('busy',{duration:0.5,queue:'end'});
  }
});
