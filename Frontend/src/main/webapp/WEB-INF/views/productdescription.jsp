<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
<link ref="text/stylesheet">
* {
    box-sizing: border-box;
}
.columns {
    float: left;
    width: 33.3%;
    padding: 8px;
}
.price {
    list-style-type: none;
    border: 1px solid #eee;
    margin: 0;
    padding: 0;
    -webkit-transition: 0.3s;
    transition: 0.3s;
}
.price:hover {
    box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}
.price .header {
    background-color: #F06292;
    color: white;
   
}
.price li {
    border-bottom: 1px solid #eee;
    padding: 18px;
    text-align: center;
}
.price .grey {
    background-color: #eee;
    font-size: 20px;
}
.button {
    background-color: #F06292 ;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
}
@media only screen and (max-width: 600px) {
    .columns {
        width: 100%;
    }
}
</style>
<script type="text/javascript">
function goBack() {
    window.history.back();
}
</script>


</head>
<body>
 <img src="resources/images/product/${product.productid}.jpg" width="500" height="500">

<th>
${product.productName}<br>
${product.productdescription}<br>
${product.category}<br>
${product.supplier}<br>
${product.price}<br>${product.stock}</th>
</h3>
<tr><td style="color: red;"><h2>${msg}</h2></td>
<td><button class="button"><a href="addToCart?productId=${product.productid}">ADDTOCART</a></button></td>
<br> 
<td><button onclick="goBack()">GoBack</button></td>
</tr>
</table>
 
 

 
 
 
 
 
 </body>
</html>