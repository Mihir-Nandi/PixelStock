import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { ArrowUpRight, Calendar, Clock } from "lucide-react"

export default function NewsPage() {
  return (
    <div className="container px-4 py-8 mx-auto">
      <div className="flex flex-col gap-6">
        <div className="flex items-center justify-between">
          <h1 className="text-3xl font-bold tracking-wider">MARKET NEWS</h1>
        </div>

        <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
          {[
            {
              title: "Fed Signals Potential Rate Cuts Later This Year",
              description:
                "The Federal Reserve indicated it may begin cutting interest rates in the coming months as inflation shows signs of cooling.",
              source: "Financial Times",
              time: "2 hours ago",
              date: "Mar 25, 2025",
              category: "Economy",
              tickers: ["SPY", "QQQ", "DIA"],
            },
            {
              title: "Apple Unveils New AI Features for iPhone",
              description:
                "Apple announced a suite of new AI-powered features coming to iPhones later this year, intensifying competition with Google and Microsoft.",
              source: "Tech Insider",
              time: "5 hours ago",
              date: "Mar 25, 2025",
              category: "Technology",
              tickers: ["AAPL", "GOOGL", "MSFT"],
            },
            {
              title: "Oil Prices Surge Amid Middle East Tensions",
              description:
                "Crude oil prices jumped 3% following reports of escalating geopolitical tensions in the Middle East, raising concerns about supply disruptions.",
              source: "Energy Report",
              time: "1 day ago",
              date: "Mar 24, 2025",
              category: "Commodities",
              tickers: ["USO", "XLE", "CVX"],
            },
            {
              title: "Nvidia Announces Next-Gen AI Chips",
              description:
                "Nvidia unveiled its next generation of AI accelerator chips, claiming 2x performance over previous models, sending shares to new all-time highs.",
              source: "Tech Report",
              time: "1 day ago",
              date: "Mar 24, 2025",
              category: "Technology",
              tickers: ["NVDA", "AMD", "INTC"],
            },
            {
              title: "Retail Sales Beat Expectations in February",
              description:
                "U.S. retail sales rose more than expected last month, suggesting consumer spending remains resilient despite higher interest rates.",
              source: "Market Watch",
              time: "2 days ago",
              date: "Mar 23, 2025",
              category: "Economy",
              tickers: ["XRT", "WMT", "AMZN"],
            },
            {
              title: "Healthcare Stocks Rally on Medicare Policy Changes",
              description:
                "Healthcare stocks surged after the government announced favorable changes to Medicare reimbursement rates for certain procedures.",
              source: "Health Finance",
              time: "3 days ago",
              date: "Mar 22, 2025",
              category: "Healthcare",
              tickers: ["XLV", "UNH", "JNJ"],
            },
          ].map((news, index) => (
            <Card key={index} className="border-2 border-primary flex flex-col">
              <CardHeader className="pb-2">
                <div className="flex justify-between items-start">
                  <Badge className="mb-2">{news.category}</Badge>
                  <div className="flex items-center text-xs text-muted-foreground">
                    <Clock className="w-3 h-3 mr-1" />
                    {news.time}
                  </div>
                </div>
                <CardTitle className="text-xl">{news.title}</CardTitle>
                <CardDescription className="flex items-center text-xs">
                  <Calendar className="w-3 h-3 mr-1" />
                  {news.date} | {news.source}
                </CardDescription>
              </CardHeader>
              <CardContent className="pb-2 flex-grow">
                <p className="text-sm">{news.description}</p>
              </CardContent>
              <CardFooter className="flex flex-col items-start pt-0">
                <div className="flex flex-wrap gap-1 mb-2">
                  {news.tickers.map((ticker) => (
                    <Badge key={ticker} variant="outline" className="text-xs">
                      ${ticker}
                    </Badge>
                  ))}
                </div>
                <Button variant="outline" size="sm" className="w-full border-2 justify-between">
                  <span>Read Full Story</span>
                  <ArrowUpRight className="w-4 h-4" />
                </Button>
              </CardFooter>
            </Card>
          ))}
        </div>
      </div>
    </div>
  )
}

