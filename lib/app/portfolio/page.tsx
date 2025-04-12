import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { ArrowDown, ArrowUp, DollarSign, PieChart, TrendingUp } from "lucide-react"
import { Button } from "@/components/ui/button"
import StockChart from "@/components/stock-chart"

export default function PortfolioPage() {
  return (
    <div className="container px-4 py-8 mx-auto">
      <div className="flex flex-col gap-6">
        <div className="flex items-center justify-between">
          <h1 className="text-3xl font-bold tracking-wider">PORTFOLIO</h1>
          <Button className="gap-1">
            <DollarSign className="w-4 h-4" />
            <span>ADD FUNDS</span>
          </Button>
        </div>

        <div className="grid gap-4 md:grid-cols-3">
          <Card className="border-2 border-primary">
            <CardHeader className="pb-2">
              <CardTitle className="text-xl">TOTAL VALUE</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-3xl font-bold">$24,892.45</p>
              <p className="flex items-center text-sm text-green-500">
                +$1,245.32 (5.3%) <TrendingUp className="w-3 h-3 ml-1" />
              </p>
            </CardContent>
          </Card>
          <Card className="border-2 border-primary">
            <CardHeader className="pb-2">
              <CardTitle className="text-xl">CASH BALANCE</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-3xl font-bold">$3,541.22</p>
              <p className="text-sm text-muted-foreground">Available for trading</p>
            </CardContent>
          </Card>
          <Card className="border-2 border-primary">
            <CardHeader className="pb-2">
              <CardTitle className="text-xl">TODAY'S CHANGE</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-3xl font-bold text-green-500">+$342.18</p>
              <p className="flex items-center text-sm text-green-500">
                +1.4% <TrendingUp className="w-3 h-3 ml-1" />
              </p>
            </CardContent>
          </Card>
        </div>

        <Tabs defaultValue="holdings" className="w-full">
          <TabsList className="grid w-full grid-cols-3 mb-4">
            <TabsTrigger value="holdings" className="font-pixel">
              HOLDINGS
            </TabsTrigger>
            <TabsTrigger value="performance" className="font-pixel">
              PERFORMANCE
            </TabsTrigger>
            <TabsTrigger value="allocation" className="font-pixel">
              ALLOCATION
            </TabsTrigger>
          </TabsList>
          <TabsContent value="holdings">
            <Card className="border-2 border-primary">
              <CardHeader>
                <CardTitle>YOUR STOCKS</CardTitle>
                <CardDescription>Manage your portfolio holdings</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {[
                    {
                      symbol: "AAPL",
                      name: "Apple Inc.",
                      shares: 15,
                      avgPrice: 150.32,
                      currentPrice: 189.84,
                      value: 2847.6,
                      change: 592.8,
                      changePercent: 26.28,
                      data: [150, 155, 153, 158, 160, 175, 180, 185, 189],
                    },
                    {
                      symbol: "MSFT",
                      name: "Microsoft Corp.",
                      shares: 10,
                      avgPrice: 350.45,
                      currentPrice: 417.88,
                      value: 4178.8,
                      change: 674.3,
                      changePercent: 19.24,
                      data: [380, 390, 400, 395, 405, 410, 415, 412, 417],
                    },
                    {
                      symbol: "NVDA",
                      name: "NVIDIA Corp.",
                      shares: 8,
                      avgPrice: 700.2,
                      currentPrice: 924.79,
                      value: 7398.32,
                      change: 1796.72,
                      changePercent: 32.07,
                      data: [850, 870, 880, 890, 900, 910, 905, 915, 924],
                    },
                    {
                      symbol: "AMZN",
                      name: "Amazon.com Inc.",
                      shares: 12,
                      avgPrice: 160.75,
                      currentPrice: 178.75,
                      value: 2145.0,
                      change: 216.0,
                      changePercent: 11.2,
                      data: [165, 168, 172, 170, 175, 177, 176, 177, 178],
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
                        <div className="text-sm">
                          {stock.shares} shares @ ${stock.avgPrice.toFixed(2)}
                        </div>
                      </div>
                      <div className="flex-1 md:text-right mt-2 md:mt-0">
                        <div className="font-bold">${stock.value.toFixed(2)}</div>
                        <div
                          className={
                            stock.change >= 0
                              ? "text-green-500 text-sm flex items-center md:justify-end"
                              : "text-red-500 text-sm flex items-center md:justify-end"
                          }
                        >
                          {stock.change >= 0 ? (
                            <ArrowUp className="w-3 h-3 mr-1" />
                          ) : (
                            <ArrowDown className="w-3 h-3 mr-1" />
                          )}
                          ${Math.abs(stock.change).toFixed(2)} ({stock.changePercent.toFixed(2)}%)
                        </div>
                      </div>
                      <div className="w-24 h-12 ml-4 mt-2 md:mt-0">
                        <StockChart data={stock.data} color={stock.change >= 0 ? "green" : "red"} />
                      </div>
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>
          </TabsContent>
          <TabsContent value="performance">
            <Card className="border-2 border-primary">
              <CardHeader>
                <CardTitle>PORTFOLIO PERFORMANCE</CardTitle>
                <CardDescription>Track your investment growth over time</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="h-80 flex items-center justify-center border-2 rounded-md p-4">
                  <div className="text-center">
                    <PieChart className="w-12 h-12 mx-auto mb-4 text-primary" />
                    <p className="text-lg font-bold">Performance Chart</p>
                    <p className="text-sm text-muted-foreground">
                      Historical performance visualization would appear here
                    </p>
                  </div>
                </div>
              </CardContent>
            </Card>
          </TabsContent>
          <TabsContent value="allocation">
            <Card className="border-2 border-primary">
              <CardHeader>
                <CardTitle>ASSET ALLOCATION</CardTitle>
                <CardDescription>View your portfolio diversification</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="h-80 flex items-center justify-center border-2 rounded-md p-4">
                  <div className="text-center">
                    <PieChart className="w-12 h-12 mx-auto mb-4 text-primary" />
                    <p className="text-lg font-bold">Allocation Chart</p>
                    <p className="text-sm text-muted-foreground">Asset allocation visualization would appear here</p>
                  </div>
                </div>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>
      </div>
    </div>
  )
}

