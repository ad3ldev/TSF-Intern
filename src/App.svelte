<script>
	export let name;
	function loadScript(src) {
		return new Promise((resolve) => {
			const script = document.createElement("script");
			script.src = src;
			script.onload = () => {
				resolve(true);
			};
			script.onerror = () => {
				resolve(false);
			};
			document.body.appendChild(script);
		});
	}
	async function displayRazorpay() {
		const res = await loadScript(
			"https://checkout.razorpay.com/v1/checkout.js",
		);

		if (!res) {
			alert("Razorpay SDK failed to load. Are you online?");
			return;
		}

		const data = await fetch("http://localhost:1337/razorpay", {
			method: "POST",
		}).then((t) => t.json());

		const options = {
			key: "rzp_test_qg3uXmuD8D5S5r",
			currency: data.currency,
			amount: data.amount.toString(),
			order_id: data.id,
			name: "Donation",
			description: "Thank you for nothing. Please give us some money",
			image: "http://localhost:1337/logo.svg",
			handler: function (response) {
				alert(response.razorpay_payment_id);
				alert(response.razorpay_order_id);
				alert(response.razorpay_signature);
			},
			prefill: {
				name,
				email: "sdfdsjfh2@ndsfdf.com",
				phone_number: "9899999999",
			},
		};
		const paymentObject = new window.Razorpay(options);
		paymentObject.open();
	}
</script>

<main>
	<h1>Hello {name}!</h1>
	<button on:click={displayRazorpay}> Hello </button>
</main>

<style>
	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
	}

	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 4em;
		font-weight: 100;
	}

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>
