import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { ArrowDown, ArrowUp, Search, TrendingDown, TrendingUp } from "lucide-react"

export default function SentimentPage() {
  return (
    <div className="container px-4 py-8 mx-auto">
      <div className="flex flex-col gap-6">
        <div className="flex items-center justify-between">
          <h1 className="text-3xl font-bold tracking-wider">MARKET SENTIMENT</h1>
        </div>

        <div className="grid gap-4 md:grid-cols-3">
          <Card className="border-2 border-primary">
            <CardHeader className="pb-2">
              <CardTitle className="text-xl">OVERALL SENTIMENT</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-2xl font-bold text-green-500">BULLISH</p>
                  <p className="flex items-center text-sm text-green-500">
                    +2.3 points <TrendingUp className="w-3 h-3 ml-1" />
                  </p>
                </div>
                <div className="w-12 h-12 rounded-full bg-green-500 flex items-center justify-center text-white text-xl font-bold">
                  65
                </div>
              </div>
            </CardContent>
          </Card>
          <Card className="border-2 border-primary">
            <CardHeader className="pb-2">
              <CardTitle className="text-xl">FEAR & GREED</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-2xl font-bold text-amber-500">GREED</p>
                  <p className="flex items-center text-sm text-amber-500">
                    +5.1 points <TrendingUp className="w-3 h-3 ml-1" />
                  </p>
                </div>
                <div className="w-12 h-12 rounded-full bg-amber-500 flex items-center justify-center text-white text-xl font-bold">
                  72
                </div>
              </div>
            </CardContent>
          </Card>
          <Card className="border-2 border-primary">
            <CardHeader className="pb-2">
              <CardTitle className="text-xl">VOLATILITY</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-2xl font-bold text-blue-500">LOW</p>
                  <p className="flex items-center text-sm text-blue-500">
                    -1.8 points <TrendingDown className="w-3 h-3 ml-1" />
                  </p>
                </div>
                <div className="w-12 h-12 rounded-full bg-blue-500 flex items-center justify-center text-white text-xl font-bold">
                  18
                </div>
              </div>
            </CardContent>
          </Card>
        </div>

        <Card className="border-2 border-primary">
          <CardHeader>
            <CardTitle>STOCK SENTIMENT ANALYSIS</CardTitle>
            <CardDescription>Analyze market sentiment for specific stocks</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="relative mb-4">
              <Search className="absolute left-2 top-2.5 h-4 w-4 text-muted-foreground" />
              <Input placeholder="Enter stock symbol..." className="pl-8 border-2" />
            </div>
            <div className="space-y-4">
              {[
                {
                  symbol: "AAPL",
                  name: "Apple Inc.",
                  sentiment: "Bullish",
                  score: 78,
                  change: 3.2,
                  news: 24,
                  social: 65,
                  analyst: 85,
                },
                {
                  symbol: "MSFT",
                  name: "Microsoft Corp.",
                  sentiment: "Bullish",
                  score: 82,
                  change: 1.5,
                  news: 32,
                  social: 75,
                  analyst: 90,
                },
                {
                  symbol: "GOOGL",
                  name: "Alphabet Inc.",
                  sentiment: "Neutral",
                  score: 52,
                  change: -2.1,
                  news: 18,
                  social: 48,
                  analyst: 65,
                },
                {
                  symbol: "AMZN",
                  name: "Amazon.com Inc.",
                  sentiment: "Bullish",
                  score: 71,
                  change: 4.3,
                  news: 28,
                  social: 70,
                  analyst: 75,
                },
                {
                  symbol: "TSLA",
                  name: "Tesla Inc.",
                  sentiment: "Bearish",
                  score: 35,
                  change: -5.7,
                  news: 42,
                  social: 30,
                  analyst: 40,
                },
              ].map((stock) => (
                <div
                  key={stock.symbol}
                  className="flex flex-col md:flex-row md:items-center justify-between p-3 border-2 rounded-md"
                >
                  <div className="flex-1">
                    <div className="flex items-center">
                      <div className="font-bold text-lg">{stock.symbol}</div>
                      <div className="ml-2 text-xs text-muted-foreground">{stock.name}</div>
                    </div>
                    <div className="flex items-center mt-1">
                      <Badge
                        className={
                          stock.sentiment === "Bullish"
                            ? "bg-green-500"
                            : stock.sentiment === "Bearish"
                              ? "bg-red-500"
                              : "bg-amber-500"
                        }
                      >
                        {stock.sentiment}
                      </Badge>
                    </div>
                  </div>
                  <div className="flex-1 md:text-center mt-2 md:mt-0">
                    <div className="text-sm text-muted-foreground">Sentiment Score</div>
                    <div className="font-bold text-xl">{stock.score}</div>
                    <div
                      className={
                        stock.change >= 0
                          ? "text-green-500 text-sm flex items-center justify-center"
                          : "text-red-500 text-sm flex items-center justify-center"
                      }
                    >
                      {stock.change >= 0 ? (
                        <ArrowUp className="w-3 h-3 mr-1" />
                      ) : (
                        <ArrowDown className="w-3 h-3 mr-1" />
                      )}
                      {stock.change.toFixed(1)} pts
                    </div>
                  </div>
                  <div className="flex-1 mt-2 md:mt-0">
                    <div className="grid grid-cols-3 gap-2 text-center">
                      <div>
                        <div className="text-xs text-muted-foreground">News</div>
                        <div className="font-bold">{stock.news}</div>
                      </div>
                      <div>
                        <div className="text-xs text-muted-foreground">Social</div>
                        <div className="font-bold">{stock.social}</div>
                      </div>
                      <div>
                        <div className="text-xs text-muted-foreground">Analyst</div>
                        <div className="font-bold">{stock.analyst}</div>
                      </div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
          <CardFooter>
            <Button className="w-full">ANALYZE MORE STOCKS</Button>
          </CardFooter>
        </Card>
      </div>
    </div>
  )
}

