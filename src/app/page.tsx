import { auth } from "@/auth";
import Navbar from "@/components/global/navbar";
import { headers } from "next/headers";

export default async function Home() {
	// const session = await auth.api.getSession({
	// 	headers: await headers(),
	// });
	return (
		<main>
			<Navbar />
		</main>
	);
}
