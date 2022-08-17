<script>
	import { scale } from "svelte/transition";
</script>

<div in:scale class="card">
	<slot />
</div>

<style lang="scss">
	$percent-small: 75%;
	$other-small: 12.5%;
	$percent-big: 60%;
	$other-big: 20%;
	.card {
		border-radius: 1rem;
		box-shadow: 0rem 0rem 1rem hsl(0, 0%, 75%);
		height: $percent-big;
		width: $percent-big;
		left: $other-big;
		top: $other-big;
		margin-top: 2.5em;
		position: fixed;
		box-sizing: border-box;
	}
	@media screen and (max-width: 650px) {
		.card {
			height: $percent-small;
			width: $percent-small;
			left: $other-small;
			top: $other-small;
			box-sizing: border-box;
		}
	}
</style>
