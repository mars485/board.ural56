/* Demonstration of embedding CodeMirror in a bigger application. The
 * interface defined here is a mess of prompts and confirms, and
 * should probably not be used in a real project.
 */

function MirrorFrame(place, options) {
  this.home = document.createElement("DIV");
  if (place.appendChild)
    place.appendChild(this.home);
  else
    place(this.home);

  var self = this;
  function makeButton(name, action) {
    var button = document.createElement("INPUT");
    button.type = "button";
    button.value = name;
    button.class = 'phpbutt';
    self.home.appendChild(button);
    button.onclick = function(){self[action].call(self);};
  }


  makeButton("<b></b>", "button1");
  makeButton("<i></i>", "button2");
  makeButton("<u></u>", "button3");
  makeButton('<img src="" width="" height="" alt="" border="0">', "button4");
  makeButton('<a href=""></a>', "button5");
  makeButton('<center></center>', "button6");
  makeButton("<div></div>", "button7");
  makeButton("<p></p>", "button8");
  makeButton("<br />", "button9");
  makeButton("<h1></h1>", "button10");


  this.mirror = new CodeMirror(this.home, options);
}

MirrorFrame.prototype = {

  button1: function() {this.mirror.replaceSelection("<b></b>");},
  button2: function() {this.mirror.replaceSelection("<i></i>");},
  button3: function() {this.mirror.replaceSelection("<u></u>");},
  button4: function() {this.mirror.replaceSelection('<img src="" width="" height="" alt="" border="0">');},
  button5: function() {this.mirror.replaceSelection('<a href=""></a>');},
  button6: function() {this.mirror.replaceSelection("<center></center>");},
  button7: function() {this.mirror.replaceSelection("<div></div>");},
  button8: function() {this.mirror.replaceSelection("<p></p>");},
  button9: function() {this.mirror.replaceSelection("<br />");},
  button10: function() {this.mirror.replaceSelection("<h1></h1>");}


};
