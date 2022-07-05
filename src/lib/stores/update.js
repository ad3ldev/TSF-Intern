import { writable } from "svelte/store";
import supabase from "$lib/supabase.js";
export default function () {
	const writing = writable(false);
	const error = writable(false);
	async function set(table, request, update) {
		writing.set(true);
		error.set(false);
		try {
			if (request == undefined) {
				throw Error("No Request was made");
			} else {
				if (update) {
					const response = await supabase
						.from(table)
						.update({ current_balance: request.balance })
						.eq("account_num", request.customer);
				} else {
					const response = await supabase.from(table).insert(request);
				}
			}
		} catch (e) {
			error.set(e);
		}
		writing.set(false);
	}
	return [writing, error, set];
}
