// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

function load(){
var username = document.getElementById("username").value;
var url = "https://api.github.com/users/" + username;
var request = new XMLHttpRequest();

request.onreadystatechange = function(){
if(request.readyState==4)
{
var data = JSON.parse(request.responseText);
document.getElementById("dis").style.display="block";
document.getElementById("name").innerHTML = data.name;
document.getElementById("user").innerHTML = data.login;
document.getElementById("name2").innerHTML = data.name;
document.getElementById("location").innerHTML = data.location;
document.getElementById("loc").innerHTML = data.location;
document.getElementById("bio").innerHTML = data.bio;
document.getElementById("image").src = data.avatar_url;
document.getElementById("image").style.width="50%";
document.getElementById("image").style.height="50%";
}
}
request.open('GET', url, true);
request.send();
}
