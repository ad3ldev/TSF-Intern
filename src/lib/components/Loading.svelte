<script>
	export let showLoading = false;
</script>

{#if showLoading}
	<div class="backdrop" on:click|self>
		<div>HELLO</div>
	</div>
{/if}

<style>
	div {
		background-color: red;
		color: black;
	}
	.backdrop {
		width: 100%;
		height: 100%;
		position: fixed;
		background: rgba(0, 0, 0, 0.8);
	}
</style>
