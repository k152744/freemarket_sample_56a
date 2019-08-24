$(function(){
  function PageLoad(){
    var canvas = document.getElementById('canvas');
    var ctx = canvas.getContext('2d');
    var wd_width = window.innerWidth;
    var wd_height = window.innerHeight;
    ctx.canvas.width = wd_width;
    ctx.canvas.height = wd_height;
    var animFrame = window.requestAnimationFrame ||
      window.webkitRequestAnimationFrame ||
      window.mozRequestAnimationFrame ||
      window.oRequestAnimationFrame ||
      window.msRequestAnimationFrame ||
      function(callback) {
        window.setTimeout(callback, 1000 / 60);
      };
    function canvas_resize() {
      var rswd_width = window.innerWidth;
      var rswd_height = window.innerHeight;

      canvas.setAttribute('width', rswd_width);
      canvas.setAttribute('height', rswd_height);
    }
    window.addEventListener('resize', canvas_resize, false);
    canvas_resize();
    function getRandomInt(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    }
    const snows = [];
    function snow() {
      this.position_x = getRandomInt(0, wd_width);
      this.position_y = getRandomInt(0, wd_height);
      this.snow_size = getRandomInt(1, 4);
      this.speed = getRandomInt(1, 3); 
      this.wind = getRandomInt(0, 0.5);　
    }
    snow.prototype.draw = function() {
        var snow_grad = ctx.createRadialGradient(
          this.position_x,
          this.position_y,
          this.snow_size * 0.6,
          this.position_x,
          this.position_y,
          this.snow_size
        );
        snow_grad.addColorStop(0, 'rgba(225, 225, 225, 0.8)');
        snow_grad.addColorStop(0.5, 'rgba(225, 225, 225, 0.2)');
        snow_grad.addColorStop(1, 'rgba(225, 225, 225, 0.1)');
        ctx.beginPath();
        ctx.fillStyle = snow_grad; // グラデーションをfillStyleプロパティにセット
        ctx.arc(this.position_x, this.position_y, this.snow_size, 0, Math.PI * 2);
        ctx.fill();
        ctx.closePath();
      }
    snow.prototype.move = function() {
      this.position_x += this.wind　 + Math.sin(this.position_y / 20) * 0.3;
      this.position_y += this.speed;

      if (this.position_y > ctx.canvas.height) {
        this.position_y = 0;
        this.position_x = getRandomInt(0, wd_width);
      }
    }
    function snow_density(snow_count) {
      for (var num = 0; num < snow_count; num++) {
        snows[num] = new snow();
      }
    }
    function snow_draw() {
      ctx.clearRect(0, 0, wd_width, wd_height);
      for (var num = 0; num < snows.length; num++) {
        snows[num].draw();
      }
    }
    function snow_move() {
      for (var num = 0; num < snows.length; num++) {
        snows[num].move();
      }
    }
    function snowy() {
      snow_draw();
      snow_move();
      animFrame(snowy);
    }
    snow_density(300);
    snowy();
  }
  if(document.URL.match("cards") && document.URL.match("snow")){
    document.addEventListener('DOMContentLoaded', PageLoad(),false);
  }
  $(".user-form-input").on("input",function() {
    var input = $(this).val();
    if (input == 20190830){
      window.location.href = 'cards/snow';
    }
  });
  $(".hello_world__btn").click(function(){
    $(".mercari-logo-header").toggleClass("addition");
    $(".hello_world").animate({
      "top":"5%",
      'easing': 'linear'
    },500);
    html=`<p>T</p>h<p>a</p>n<p>k</p>y<p>o</p>u<p>f</p>o<p>r</p>E<p>v</p>e<p>r</p>y<p>t</p>h<p>i</p>n<p>g</p>`
    $(".photo_team--text").append(html)
    $(".snow_modal--open").fadeIn(2000);
  })
});