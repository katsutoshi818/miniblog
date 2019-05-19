// $(function(){
//   $("#js").on("submit", function(e){
//     e.preventDefault();
//     var text = $("#js_text").val()
//     $.ajax({
//       url: "/blogs//comments",
//       type: 'post',
//       dataType: 'json'
//     })
//     .done(function(data){
      
//     })
//     .fail(function(){
//       alert("コメントが送信できません");
//     });
//   });
// });

$(document).on("ajax:success", "#js", function(e) {
  console.log(e.detail[2]);
});