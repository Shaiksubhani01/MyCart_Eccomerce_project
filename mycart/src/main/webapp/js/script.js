
function add_to_cart(pid, pname, pprice, pQuantity) {

	let cart = localStorage.getItem("cart");

	if (cart == null) {
		//no cart yet
		let products = [];
		let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: pprice };
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		//console.log("product is added for the first time")
		showToast("Item is added to cart")
	} else {
		//cart is already present	
		let pcart = JSON.parse(localStorage.getItem('cart'));

		if (pcart.find((item) => item.productId == pid)) {

			let oldProduct = pcart.find((item) => item.productId == pid)
			if (pQuantity > oldProduct.productQuantity) {
				//we have to increase the quantity
				oldProduct.productQuantity = oldProduct.productQuantity + 1
				pcart.map((item) => {

					if (item.productId == oldProduct.productId) {

						item.productQuantity = oldProduct.productQuantity;

					}





				})


				localStorage.setItem("cart", JSON.stringify(pcart));
				console.log("product quantity is increased")
				showToast(oldProduct.productName + "  Quantity is increased , Quantity=" + oldProduct.productQuantity)


			} else { showToast("quantity of the product not available") }

		} else {
			//not find
			//we have to add product
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: pprice };
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product is added ")
			showToast("Product is added to Cart")
		}

	}
	updateCart(pQuantity);
}


//update cart
function updateCart(pQuantity) {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {
		console.log("Your Cart Is Empty...!!")
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h1>Cart Does Not Have Any Items</h1>");
		$(".checkout-btn").attr('disabled', true)
	} else {
		//there is something in cart
		console.log(cart)
		$(".cart-items").html(`( ${cart.length} )`);

		let table = `
		
		<table class='table'>
		<thead class='thead-light'>
		<tr>
		<th>Item Name</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Total Price</th>
		<th>Action</th>
		
		</tr>
		</thead>
		
		
		
		
		
		`;
		let totalprice = 0;
		cart.map((item) => {

			table += `
			
			<tr>
			<td class='font-weight-bold'>${item.productName}</td>
			<td class='font-weight-bold'>${item.productPrice}</td>
			<td class='font-weight-bold'>${item.productQuantity}
			 <button  onclick='increaseQuantity(${item.productId},${pQuantity})' class='btn btn-danger btn-sm'>+</button>
        <button  onclick='decreaseQuantity(${item.productId})' class='btn btn-danger btn-sm'>-</button></td>
			<td class='font-weight-bold'>${item.productQuantity * item.productPrice}</td>
			<td ><button  onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
			</tr>
			
			
			
			
			
			`
			totalprice += item.productPrice * item.productQuantity;




		})


		table = table + `
		<tr><td colspan='5' class='text-right font-weight-bold m-5'> Total Price : ${totalprice}</td></tr>
		
		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled', false)
	}

}

//delete item
function deleteItemFromCart(pid) {
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newCart = cart.filter((item) => item.productId != pid)
	localStorage.setItem('cart', JSON.stringify(newCart))
	updateCart();
	showToast("Item is removed from Cart")

}


function increaseQuantity(pid, pQuantity) {

	//cart is already present	
	let pcart = JSON.parse(localStorage.getItem('cart'));
	if (pcart.find((item) => item.productId == pid)) {

		let oldProduct = pcart.find((item) => item.productId == pid)
		if (pQuantity > oldProduct.productQuantity) {
			//we have to increase the quantity
			oldProduct.productQuantity = oldProduct.productQuantity + 1
			pcart.map((item) => {

				if (item.productId == oldProduct.productId) {

					item.productQuantity = oldProduct.productQuantity;

				}





			})


			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product quantity is increased")
			showToast(oldProduct.productName + "  Quantity is increased , Quantity=" + oldProduct.productQuantity)


		} else { showToast("quantity of the product not available") }
	}
	updateCart(pQuantity);
}


function decreaseQuantity(pid) {
	//cart is already present	
	let pcart = JSON.parse(localStorage.getItem('cart'));
	let oldProduct = pcart.find((item) => item.productId == pid)
	console.log(oldProduct.productQuantity)


	if (oldProduct.productQuantity > 1) {

		//we have to increase the quantity
		oldProduct.productQuantity = oldProduct.productQuantity - 1
		pcart.map((item) => {

			if (item.productId == oldProduct.productId) {

				item.productQuantity = oldProduct.productQuantity;

			}





		})

		localStorage.setItem("cart", JSON.stringify(pcart));
		console.log("product quantity is decreased")
		showToast(oldProduct.productName + "  Quantity is decreased, Quantity=" + oldProduct.productQuantity)
	} else {
		console.log("product quantity is should not lessthan 1")
		showToast(oldProduct.productName + "  product quantity is should not lessthan 1")
	}
	updateCart();
}
$(document).ready(function() {

	updateCart();
})


function showToast(content) {

	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 2500);
}
function goToCheckoutPage() {
	window.location = "checkout.jsp"
}

function goToeditProduct() {
	window.location = "editProduct.jsp"
}
function goToview_products() {
	window.location = "view_products.jsp"
}
function goToHomePage() {
	window.location = "index.jsp"
}
