<script>
	import Loading from "$lib/components/Loading.svelte";
	let showLoading = false;
	let toggleLoading = () => {
		showLoading = !showLoading;
		setTimeout(() => {
			showLoading = !showLoading;
		}, 5000);
	};
</script>

<Loading {showLoading} on:click={toggleLoading} />

<div class="home" />

<style>
	.home {
		width: 100%;
		height: 100%;
		background: url(/src/lib/assets/bank.jpg) no-repeat center center;
		background-size: cover;
	}
</style>
