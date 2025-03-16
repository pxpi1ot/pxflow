import type { Config } from "tailwindcss";

export default {
<<<<<<< HEAD
  content: [
=======
<<<<<<< HEAD
    darkMode: ["class"],
    content: [
=======
<<<<<<< HEAD
  content: [
>>>>>>> 20b38a6 (better-auth-nextjs 模板)
>>>>>>> 8ada87d (better-auth-nextjs 模板)
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
=======
    darkMode: ["class"],
    content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
>>>>>>> 3acb180 (better-auth-nextjs 模板)
  ],
  theme: {
    extend: {
      colors: {
        background: "var(--background)",
        foreground: "var(--foreground)",
      },
    },
  },
  plugins: [],
} satisfies Config;
