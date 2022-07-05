<script>
	import Loading from "$lib/components/Loading.svelte";

	let showLoading = false;
	let toggleLoading = () => {
		showLoading = !showLoading;
	};
</script>

<Loading {showLoading} on:click={toggleLoading} />

<button on:click={toggleLoading}>Hello</button>
