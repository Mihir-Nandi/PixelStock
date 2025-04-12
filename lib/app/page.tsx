import Link from "next/link"
import { ArrowUpRight, TrendingUp, Newspaper, PieChart } from "lucide-react"

import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import StockChart from "@/components/stock-chart"
import { TopStocks } from "@/components/top-stocks"

export default function Home() {
  return (
    <div className="container px-4 py-8 mx-auto">
      <div className="flex flex-col gap-6">
        <section className="space-y-4">
          <div className="flex items-center justify-between">
            <h2 className="text-3xl font-bold tracking-wider">MARKET OVERVIEW</h2>
            <Button variant="ghost" size="sm" className="gap-1">
              <span>View all</span>
              <ArrowUpRight className="w-4 h-4" />
            </Button>
          </div>
          <div className="grid gap-4 md:grid-cols-3">
            <Card className="border-2 border-primary">
              <CardHeader className="pb-2">
                <CardTitle className="text-xl">S&P 500</CardTitle>
                <CardDescription>US Large Cap</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="flex items-center justify-between">
                  <div>
                    <p className="text-2xl font-bold">4,783.45</p>
                    <p className="flex items-center text-sm text-green-500">
                      +1.2% <TrendingUp className="w-3 h-3 ml-1" />
                    </p>
                  </div>
                  <div className="w-24 h-12">
                    <StockChart data={[30, 40, 45, 50, 49, 60, 70, 91, 81]} color="green" />
                  </div>
                </div>
              </CardContent>
            </Card>
            <Card className="border-2 border-primary">
              <CardHeader className="pb-2">
                <CardTitle className="text-xl">NASDAQ</CardTitle>
                <CardDescription>US Tech</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="flex items-center justify-between">
                  <div>
                    <p className="text-2xl font-bold">16,742.39</p>
                    <p className="flex items-center text-sm text-green-500">
                      +1.6% <TrendingUp className="w-3 h-3 ml-1" />
                    </p>
                  </div>
                  <div className="w-24 h-12">
                    <StockChart data={[40, 30, 70, 80, 60, 90, 95, 91, 92]} color="green" />
                  </div>
                </div>
              </CardContent>
            </Card>
            <Card className="border-2 border-primary">
              <CardHeader className="pb-2">
                <CardTitle className="text-xl">DOW JONES</CardTitle>
                <CardDescription>US Blue Chip</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="flex items-center justify-between">
                  <div>
                    <p className="text-2xl font-bold">38,239.98</p>
                    <p className="flex items-center text-sm text-green-500">
                      +0.8% <TrendingUp className="w-3 h-3 ml-1" />
                    </p>
                  </div>
                  <div className="w-24 h-12">
                    <StockChart data={[50, 60, 55, 80, 75, 65, 75, 80, 85]} color="green" />
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>
        </section>

        <section className="grid gap-6 md:grid-cols-3">
          <div className="md:col-span-2">
            <Card className="border-2 border-primary h-full">
              <CardHeader>
                <CardTitle className="text-2xl tracking-wider">TOP MOVERS</CardTitle>
              </CardHeader>
              <CardContent>
                <TopStocks />
              </CardContent>
              <CardFooter>
                <Button variant="outline" className="w-full border-2">
                  VIEW ALL STOCKS
                </Button>
              </CardFooter>
            </Card>
          </div>
          <div>
            <Card className="border-2 border-primary h-full">
              <CardHeader>
                <CardTitle className="text-2xl tracking-wider">QUICK LINKS</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <Link href="/portfolio">
                  <Button variant="outline" className="w-full justify-between border-2">
                    <div className="flex items-center">
                      <PieChart className="w-5 h-5 mr-2" />
                      <span>Portfolio</span>
                    </div>
                    <ArrowUpRight className="w-4 h-4" />
                  </Button>
                </Link>
                <Link href="/news">
                  <Button variant="outline" className="w-full justify-between border-2">
                    <div className="flex items-center">
                      <Newspaper className="w-5 h-5 mr-2" />
                      <span>News</span>
                    </div>
                    <ArrowUpRight className="w-4 h-4" />
                  </Button>
                </Link>
                <Link href="/sentiment">
                  <Button variant="outline" className="w-full justify-between border-2">
                    <div className="flex items-center">
                      <TrendingUp className="w-5 h-5 mr-2" />
                      <span>Sentiment</span>
                    </div>
                    <ArrowUpRight className="w-4 h-4" />
                  </Button>
                </Link>
              </CardContent>
            </Card>
          </div>
        </section>
      </div>
    </div>
  )
}

