import { Elm } from "./elm/Main.elm";

if (document.readyState !== 'loading') {
	init();
} else {
	document.addEventListener("DOMContentLoaded", () => {
		init()
	});
}

function init() {
	const app = Elm.Main.init();

	app.ports.scrollTo.subscribe(function (id) {
		const element = document.getElementById(id);
		if (element) {
			element.scrollIntoView();
		}
	});
}