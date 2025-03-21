import { Button } from "@/components/ui/button";
import { Loader2 } from "lucide-react";
export default function LoadingButton({
	pending,
	children,
	onClick,
}: {
	pending: boolean;
	children: React.ReactNode;
	onClick?: () => void;
}) {
	return (
		<Button
			onClick={onClick}
			className="w-full"
			type="submit"
			disabled={pending}
		>
			{pending ? (
				<div className="flex items-center justify-center">
					<Loader2 className="mr-2 h-4 w-4 animate-spin" />
				</div>
			) : (
				children
			)}
		</Button>
	);
}
