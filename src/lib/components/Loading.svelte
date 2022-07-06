<script>
	export let showLoading = false;
</script>

{#if showLoading}
	<div class="backdrop">
		<div class="loader" />
	</div>
{/if}

<style lang="scss">
	.loader {
		color: #1b58a8;
		width: 10rem;
		aspect-ratio: 1;
		display: grid;
		mask: conic-gradient(from 15deg, #0000, #000);
		animation: load 1s steps(12) infinite;
	}
	.loader,
	.loader:before,
	.loader:after {
		background: radial-gradient(
					closest-side at 50% 12.5%,
					currentColor 90%,
					#0000 98%
				)
				50% 0/20% 80% repeat-y,
			radial-gradient(
					closest-side at 12.5% 50%,
					currentColor 90%,
					#0000 98%
				)
				0 50%/80% 20% repeat-x;
	}
	.loader:before,
	.loader:after {
		content: "";
		grid-area: 1/1;
		transform: rotate(30deg);
	}
	.loader:after {
		transform: rotate(60deg);
	}
	@keyframes load {
		from {
			transform: rotate(0turn);
		}
		to {
			transform: rotate(1turn);
		}
	}
	.backdrop {
		position: absolute;
		left: 0;
		top: 0;
		width: 100vw;
		height: 100vh;
		background: rgba(0, 0, 0, 0.09);
		display: grid;
		justify-items: center;
		align-items: center;
	}
</style>
