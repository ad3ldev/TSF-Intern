import { writable } from "svelte/store";
import supabase from "$lib/supabase.js";
export default function () {
	const writing = writable(false);
	const error = writable(false);
	async function set(table, request) {
		writing.set(true);
		error.set(false);
		try {
			if (request == undefined) {
				throw Error("No Request was made");
			} else {
				const response = await supabase.from(table).insert(request);
				et(response.data);
			}
		} catch (e) {
			error.set(e);
		}
		writing.set(false);
	}
	return [writing, error, set];
}
