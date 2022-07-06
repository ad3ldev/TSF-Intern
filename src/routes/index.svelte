<script>
	import Loading from "$lib/components/Loading.svelte";
	import Button from "$lib/components/Button.svelte";
	let showLoading = false;
	let toggleLoading = () => {
		showLoading = !showLoading;
	};
</script>

<Loading {showLoading} on:click={toggleLoading} />

<Button on:click={toggleLoading}>Hello</Button>
