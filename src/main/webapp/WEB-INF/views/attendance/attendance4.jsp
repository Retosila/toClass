    <script type="text/javascript">
      $(document).ready(function(){
        $('button').on('click', function() {
          var vacation = $(this).closest('.vacation');
          var amount = vacation.data('price');
          var price = $('<p>From $' + amount + '</p>');           
          vacation.append(price);   
          $(this).remove();       
        }); 
      });    

    </script>
        <ul>
          <li class='vacation' data-price='299.99'>
            <button>GET PRICE</button>
          </li>
        </ul>