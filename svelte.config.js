import preprocess from "svelte-preprocess";
import adapter from "@sveltejs/adapter-static";

const dev = "production" === "development";

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		adapter: adapter({
			pages: "docs",
			assets: "docs",
		}),
		paths: {
			base: dev ? "" : "/TSF-Intern",
		},
		vite: {
			css: {
				preprocessorOptions: {
					scss: {
						additionalData: '@use "src/variables.scss" as *;',
					},
				},
			},
		},
	},

	preprocess: [
		preprocess({
			scss: {
				prependData: '@use "src/variables.scss" as *;',
			},
		}),
	],
};

export default config;
