"use client"

import { useState } from "react"
import { ArrowDown, ArrowUp, Search } from "lucide-react"
import { Input } from "@/components/ui/input"
import { Badge } from "@/components/ui/badge"
import StockChart from "@/components/stock-chart"

const stockData = [
  {
    symbol: "AAPL",
    name: "Apple Inc.",
    price: 189.84,
    change: 2.45,
    changePercent: 1.31,
    data: [150, 155, 153, 158, 160, 175, 180, 185, 189],
  },
  {
    symbol: "MSFT",
    name: "Microsoft Corp.",
    price: 417.88,
    change: 3.22,
    changePercent: 0.78,
    data: [380, 390, 400, 395, 405, 410, 415, 412, 417],
  },
  {
    symbol: "GOOGL",
    name: "Alphabet Inc.",
    price: 174.13,
    change: -1.25,
    changePercent: -0.71,
    data: [180, 178, 175, 172, 170, 168, 171, 173, 174],
  },
  {
    symbol: "AMZN",
    name: "Amazon.com Inc.",
    price: 178.75,
    change: 1.89,
    changePercent: 1.07,
    data: [165, 168, 172, 170, 175, 177, 176, 177, 178],
  },
  {
    symbol: "NVDA",
    name: "NVIDIA Corp.",
    price: 924.79,
    change: 15.63,
    changePercent: 1.72,
    data: [850, 870, 880, 890, 900, 910, 905, 915, 924],
  },
  {
    symbol: "META",
    name: "Meta Platforms",
    price: 474.99,
    change: -3.45,
    changePercent: -0.72,
    data: [490, 485, 480, 478, 475, 472, 470, 473, 474],
  },
]

export function TopStocks() {
  const [searchTerm, setSearchTerm] = useState("")

  const filteredStocks = stockData.filter(
    (stock) =>
      stock.symbol.toLowerCase().includes(searchTerm.toLowerCase()) ||
      stock.name.toLowerCase().includes(searchTerm.toLowerCase()),
  )

  return (
    <div className="space-y-4">
      <div className="relative">
        <Search className="absolute left-2 top-2.5 h-4 w-4 text-muted-foreground" />
        <Input
          placeholder="Search stocks..."
          className="pl-8 border-2"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
      </div>
      <div className="space-y-2">
        {filteredStocks.map((stock) => (
          <div
            key={stock.symbol}
            className="flex items-center justify-between p-2 border-2 rounded-md hover:bg-muted/50 cursor-pointer"
          >
            <div className="flex-1">
              <div className="flex items-center">
                <div className="font-bold">{stock.symbol}</div>
                <Badge variant="outline" className="ml-2 text-xs">
                  {stock.name}
                </Badge>
              </div>
            </div>
            <div className="flex-1 text-right">
              <div className="font-bold">${stock.price.toFixed(2)}</div>
              <div
                className={
                  stock.change >= 0
                    ? "text-green-500 text-sm flex items-center justify-end"
                    : "text-red-500 text-sm flex items-center justify-end"
                }
              >
                {stock.change >= 0 ? <ArrowUp className="w-3 h-3 mr-1" /> : <ArrowDown className="w-3 h-3 mr-1" />}
                {stock.change >= 0 ? "+" : ""}
                {stock.change.toFixed(2)} ({stock.changePercent.toFixed(2)}%)
              </div>
            </div>
            <div className="w-24 h-12 ml-4">
              <StockChart data={stock.data} color={stock.change >= 0 ? "green" : "red"} />
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

