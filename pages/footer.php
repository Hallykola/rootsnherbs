</div>
    <footer class="bg-white sticky-footer">
        <div class="container my-auto">
            <div class="text-center my-auto copyright"><span>Copyright © Roots and Herbs 2021</span></div>
        </div>
    </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/chart.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/script.min.js"></script>
    <script>
 function checkpassword() {
            let pass = document.getElementById('password').value;
            let repass = document.getElementById('re-password').value;
            let reply = document.getElementById('password-reply');
            let button = document.getElementById('submit-btn');
            if (pass.length < 6 ) {
                reply.innerHTML = 'password is too short';
                reply.style.color = 'red';
            } else if (pass === repass & pass != '' ) {
                reply.innerHTML = 'password match';   
                reply.style.color = 'green'; 
                button.removeAttribute('disabled');            
            } else {
                reply.innerHTML = 'password does not match';
                reply.style.color = 'red';
            }
            console.log(pass);
            console.log(repass);
        }
    </script>
    
    <script>
    $(document).ready(function(){
        $(".add-row").click(function(){
            var name = $("#product").find('option:selected').text();
            var val = $("#product").val();
            
            var markup = "<tr><td><input type='checkbox' name='record'></td><td class = 'desc' >" + name + "</td><td class = 'bv'>" + val + "</td><td><input type='number' name='quantity' class='quantity' onkeyup='work(this);' value= '1'></td><td class='amount'>"+val+"</td></tr>";
            $("table tbody:first").append(markup);
        });
        
        // Find and remove selected table rows
        $(".delete-row").click(function(){
            $("table tbody:first").find('input[name="record"]').each(function(){
            	if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
        });
    });
       $(".show").click(function(){
         var content = 0;
            $("table tbody:first").find(".amount").each(function(){
            	
                    content += Number($(this).text());
                
            });
            $("#usebv").val(content);
            var content1 = "";
            $("table tbody:first").find(".desc").each(function(){
            	
                   content1 += $(this).text()+ '-' +$(this).parent().find('.quantity').val() +' |';
                
            });
            $("#usedesc").val(content1);
          
        });
        function work(el){
           
            	var parent = el.parentElement.parentElement;
                var bv = parent.querySelector('.bv').innerText;
                var quantity = parent.querySelector('.quantity').value;
                var amount = parent.querySelector('.amount').innerText;
                parent.querySelector('.amount').innerText = bv*quantity;
                
           
        }
            
            
          
       

       

        </script>

        <script>
        // AJAX call for autocomplete 
$(document).ready(function(){
	$("#search-box").keyup(function(){
		$.ajax({
		type: "POST",
		url: "suggestusers",
		data:'keyword='+$(this).val(),
		beforeSend: function(){
			$("#search-box").css("background","#FFF url(LoaderIcon.gif) no-repeat 165px");
		},
		success: function(data){
			$("#suggesstion-box").show();
			$("#suggesstion-box").html(data);
			$("#search-box").css("background","#FFF");
		}
		});
	});
});
//To select user name
function selectUser(val) {
$("#search-box").val(val);
$("#suggesstion-box").hide();
}
</script>
</body>

</html>