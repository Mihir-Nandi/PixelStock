"use client"

import Link from "next/link"
import { usePathname } from "next/navigation"
import { Home, PieChart, Newspaper, TrendingUp, Moon, Sun } from "lucide-react"

import { Button } from "@/components/ui/button"
import { useTheme } from "next-themes"

export default function Navbar() {
  const pathname = usePathname()
  const { theme, setTheme } = useTheme()

  return (
    <header className="sticky top-0 z-50 w-full border-b bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60">
      <div className="container flex h-14 items-center">
        <Link href="/" className="mr-6 flex items-center space-x-2">
          <span className="font-pixel text-xl font-bold tracking-wider">
            PIXEL<span className="text-primary">STOCK</span>
          </span>
        </Link>
        <nav className="flex items-center space-x-6 text-sm font-medium">
          <Link href="/" className={`flex items-center ${pathname === "/" ? "text-primary" : "text-muted-foreground"}`}>
            <Home className="w-4 h-4 mr-1" />
            <span className="hidden sm:inline-block">Home</span>
          </Link>
          <Link
            href="/portfolio"
            className={`flex items-center ${pathname === "/portfolio" ? "text-primary" : "text-muted-foreground"}`}
          >
            <PieChart className="w-4 h-4 mr-1" />
            <span className="hidden sm:inline-block">Portfolio</span>
          </Link>
          <Link
            href="/news"
            className={`flex items-center ${pathname === "/news" ? "text-primary" : "text-muted-foreground"}`}
          >
            <Newspaper className="w-4 h-4 mr-1" />
            <span className="hidden sm:inline-block">News</span>
          </Link>
          <Link
            href="/sentiment"
            className={`flex items-center ${pathname === "/sentiment" ? "text-primary" : "text-muted-foreground"}`}
          >
            <TrendingUp className="w-4 h-4 mr-1" />
            <span className="hidden sm:inline-block">Sentiment</span>
          </Link>
        </nav>
        <div className="flex items-center ml-auto">
          <Button
            variant="ghost"
            size="icon"
            aria-label="Toggle Theme"
            className="mr-2"
            onClick={() => setTheme(theme === "dark" ? "light" : "dark")}
          >
            <Sun className="h-4 w-4 rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
            <Moon className="absolute h-4 w-4 rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
            <span className="sr-only">Toggle theme</span>
          </Button>
        </div>
      </div>
    </header>
  )
}

