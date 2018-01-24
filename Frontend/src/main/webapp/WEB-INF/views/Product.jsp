<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product form</title>
<script type="text/javascript">
	function formProduct() {
		// Make quick references to our fields
		var productName = document.getElementById('productName');
		var productdescription = document.getElementById('productdescription');
		var category = document.getElementById('category');
		var supplier = document.getElementById('supplier');
		var price = document.getElementById('price');
		var Stock = document.getElementById('Stock');
		var file = document.getElementById('file');
		
		
		if (notEmpty(productName, "productName Should not be empty")) {
			if (isAlphabet(productName, "Please enter only letters for productName")) {
				if (notEmpty(productdescription, "productdescription Should not be empty")) {
					if (isAlphanumeric(productdescription, "productdescription Should not be empty")) {
					   if (notEmpty(category, "category Should not be empty")) {
						 if (notEmpty(supplier, "supplier Should not be empty")) {
							if (notEmpty(price,"price Should not be empty")) {
									if (isNumeric(price,"Please enter only numbers for price")) {
										if (notEmpty(Stock,"Stock Should not be empty")) {
											if (isNumeric(Stock,"Please enter only numbers for Stock")) {
												if (notEmpty(file,"file Should not be empty")) {
												
										return true;
		           							}
											}
					        			}
							       }
						       }
					       }
				      }
			      }
		       }
			}
		}
		return false;
	}
	function notEmpty(elem, helperMsg) {
		if (elem.value.length == 0) {
			alert(helperMsg);
			elem.focus(); // set the focus to this input
			return false;
		}
		return true;
	}
	function isAlphabet(elem, helperMsg) {
		var alphaExp = /^[a-z A-Z]+$/;
		if (elem.value.match(alphaExp)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
	function emailValidator(elem, helperMsg) {
		var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
		if (elem.value.match(emailExp)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
	function isAlphanumeric(elem, helperMsg) {
		var alphaExp = /^[0-9a-zA-Z]+$/;
		if (elem.value.match(alphaExp)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
	function isNumeric(elem, helperMsg) {
		var numericExpression = /^[0-9]+$/;
		if (elem.value.match(numericExpression)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
</script>
</head>
<style>
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=submit] {
    width: 100%;
    background-color: blue;
    color: white;
    padding: 14px 32px;
    margin: 25px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=submit]:hover {
    background-color: purple;
}

div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
body {
    background-color: pink;
}

</style>

<body>
<fieldset>
<legend>Product</legend>
   <form name="ProductForm"  action="addProduct" onsubmit="return formProduct()" method="post" enctype="multipart/form-data">
   <table align="center" >
   
  <tr><td>Product Name:</td>
  <td><input class="form-control" type="text" name="productName" Id="productName"></td></tr>
 <tr><td> Product Description:</td>
 <td><input class="form-control" type="text" name="productdescription" Id="productdescription"></td></tr>
  <tr><td>  Category:</td><td><select name="category" Id="category">
   <option value="">select your category</option>
   	<c:forEach items="${categoryList}" var="category">
<option value="${category.categoryName}">${category.categoryName}</option>
</c:forEach>
</select></td></tr>
<tr><td>Supplier:</td><td><select name="supplier" Id="supplier">
   <option value="">select your supplier</option>
   <c:forEach items="${supplierList}" var="supplier">	
   <option value="${supplier.name}">${supplier.name}</option>
   </c:forEach>
</select></td></tr>
<tr><td>Price:</td><td>
<input class="form-control" type="text" name="price" Id="price"></td></tr>
<tr><td>stock:</td><td>
<input class="form-control" type="text" name="Stock" Id="Stock"></td></tr>
<tr><td>file to upload:</td><td>
<input class="form-control" type="file" name="file" Id="file"></td></tr>

<tr><td><input type="submit" name="submit" value="new product"></td></tr>

</table>
</form>
</fieldset>
</body>