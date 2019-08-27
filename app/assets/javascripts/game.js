$(document).ready(function(){
  const coincnt = 12;
  for(var i = 0;i < coincnt; i++){
    $(".point-game").append("<li></li>")
  }
  $(".point-game").children().addClass("normal");
  const big = Math.floor( Math.random() * coincnt );
  const middle = Math.floor( Math.random() * coincnt );
  const small = Math.floor( Math.random() * coincnt );
  const out = 0
  const big_hit = 100
  const middle_hit = 50
  const small_hit =10
  $(".point-game").children().attr("data-role",out);
  $(".point-game li").eq(big).attr("data-role",big_hit);
  $(".point-game li").eq(middle).attr("data-role",middle_hit);
  $(".point-game li").eq(small).attr("data-role",small_hit);

  function notice(li){  
    var hit =  $(li).data("role")
    var log = function(){
                          $(".game-modal").fadeIn(); 
                        };
    var out = function(){
                          $(".game-modal-out").fadeIn(); 
                        };  
    var autoOut = function(){
                              URL = document.URL
                              reURL = URL.replace("/game#","")
                              location.href= reURL;
                            }                                                      
    if(hit  == "50" || hit == "10" || hit =="100"){
      li.attr("class","hit");
    }else{
      li.attr("class","out");
    }
      $.ajax({
        url: "/products/game",
        type: "GET",
        data: {point: hit},
        dataType: "json",
      })
      
      .done(function(point){
        if(point > 1){
          console.log("成功")
          $(".game-modal__overlay__content__point").text(point);
          setTimeout(log, 3000);
          setTimeout(autoOut, 10000);
        }else{
          console.log("失敗")
          setTimeout(out, 3000);
          setTimeout(autoOut, 10000);
        } 
      })

      .fail(function(){
        alert('error');
      });  
    
  }

  function turn(li , f , b ,motiontime){
    $({deg:f}).animate({deg:b},{
      duration:motiontime,
      progress:function(){
      $(li).css({transform:'rotateY('+this.deg+'deg)'})
      }
    })
  }
  const angle_s = 0;
  const angle_e = 360;
  
  function motion(li){
    const motiontime = 75;
    for(var i=0;i<=50;i++){
      if (i!=50){
        setTimeout(function(){
          turn(li,angle_s,angle_e,motiontime);
        },(motiontime*i));
      }else{
        setTimeout(function(){
          turn(li,angle_e,angle_s,motiontime);
          notice(li)
        },(motiontime*i));
      }
    }
  }
  

  $(".point-game li").on("click",function(){
    motion($(this));
  })
  
})







