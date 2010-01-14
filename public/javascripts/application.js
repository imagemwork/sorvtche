// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

  Ajax.Responders.register({
    onComplete: function(responder, request){  
      var response = (request.responseText.evalJSON(true)); 
      if (response.object)  {
        // Remove old erroes
        $(response.object + "_form").select(".error").invoke("removeClassName", "error");
        $(response.object + "_form").select(".error_message").invoke("remove");
  
        // Success: clear all input with text
       	if (response.success) {
          var form = $(response.object + "_form");
          form.select(".text").each(function(element) {element.value = ""});
        }
        // Else add error by creating a div with error message
        else {
          response.errors.each(function(error) {     
            var element = $(response.object + "_" + error[0]);
            if (element) {
              element.addClassName("error");
              element.insert({after: new Element("div", {className: "error_message"}).update(error[1])});
            }
          })
        }
      }
    }
 });   


function validationForm(){
	alert("Hello Fuck Users");
}

function ShowEdit(id){
	document.getElementById('edit_product_'+ id).style.display = 'block'
}

function HideEdit(id){
	document.getElementById('edit_product_'+ id).style.display = 'none'
}