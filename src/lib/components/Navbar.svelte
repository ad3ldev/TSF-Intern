<script>
	// import bankIconBlack from "$lib/assets/bankIconBlack.png";
	import bankIconWhite from "$lib/assets/bankIconWhite.png";
</script>

<nav class="navbar">
	<ul>
		<li class="icon">
			<a href="/">
				<img src={bankIconWhite} alt="bank-icon" />
			</a>
		</li>
		<li>
			<a sveltekit:prefetch href="/">Home</a>
		</li>
		<li>
			<a sveltekit:prefetch href="/customers">Customers</a>
		</li>
		<li>
			<a sveltekit:prefetch href="/transfers">Transfers</a>
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
