<script>
	// import bankIconBlack from "$lib/assets/bankIconBlack.png";
	import bankIconWhite from "$lib/assets/bankIconWhite.png";
	import { page } from "$app/stores";
	let home = false;
	let customers = false;
	let transfers = false;
	if ($page.routeId != null) {
		switch (true) {
			case $page.routeId == "":
				home = true;
				customers = false;
				transfers = false;
				break;
			case $page.routeId.includes("customers"):
				home = false;
				customers = true;
				transfers = false;
				break;
			case $page.routeId.includes("transfers"):
				home = false;
				customers = false;
				transfers = true;
				break;
			default:
				home = false;
				customers = false;
				transfers = false;
				break;
		}
	}

	const changeTab = (tab) => {
		switch (tab) {
			case "":
				home = true;
				customers = false;
				transfers = false;
				break;
			case "customers":
				home = false;
				customers = true;
				transfers = false;
				break;
			case "transfers":
				home = false;
				customers = false;
				transfers = true;
				break;
			default:
				home = false;
				customers = false;
				transfers = false;
				break;
		}
	};
</script>

<nav class="navbar">
	<ul>
		<li class="icon">
			<a
				href="/"
				on:click={() => {
					changeTab("");
				}}
			>
				<img src={bankIconWhite} alt="bank-icon" />
			</a>
		</li>
		<li>
			<a
				class:active={home}
				on:click={() => {
					changeTab("");
				}}
				sveltekit:prefetch
				href="/">Home</a
			>
		</li>
		<li>
			<a
				class:active={customers}
				on:click={() => {
					changeTab("customers");
				}}
				sveltekit:prefetch
				href="/customers">Customers</a
			>
		</li>
		<li>
			<a
				class:active={transfers}
				on:click={() => {
					changeTab("transfers");
				}}
				sveltekit:prefetch
				href="/transfers">Transfers</a
			>
		</li>
	</ul>
</nav>

<style lang="scss">
	.navbar {
		background: #1b58a8;

		ul {
			box-sizing: border-box;
			padding: 0;
			margin: 0;
			display: grid;
			width: 100%;
			grid-template-columns: 2fr 1fr 1fr 1fr;
			justify-items: center;
			align-items: center;
			li {
				box-sizing: border-box;
				margin: 0 1.5rem;
				list-style-type: none;
				justify-self: end;
				a {
					box-sizing: border-box;
					text-decoration: none;
					color: #fff;
					font-size: clamp(0.5rem, 0.0385rem + 2.3077vw, 1.25rem);
				}
				.active {
					padding-bottom: 0.2rem;
					border-bottom: 2px solid white;
				}
			}

			.icon {
				justify-self: center;
				img {
					width: clamp(2.5rem, 0.6538rem + 9.2308vw, 5.5rem);
				}
			}
		}
	}
</style>
