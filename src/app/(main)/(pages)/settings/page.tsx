import ProfileForm from "@/components/forms/profile-form";
import React from "react";

const DashboardPage = () => {
	return (
		<div className="flex flex-col gap-4 relative">
			<h1 className="text-2xl sticky top-0 z-[10] p-6 bg-background/50 backdrop-blur-lg flex items-center border-b">
				setting
			</h1>
			<div className="flex flex-col gap-10 p-6">
				<div>
					<h2 className="text-xl font-bold">User Profile</h2>
					<p className="text-base text-white/50">
						Add or update your information
					</p>
				</div>
                <ProfileForm />
			</div>
		</div>
	);
};

export default DashboardPage;
