"use client"

import { useEffect, useRef } from "react"

interface StockChartProps {
  data: number[]
  color: string
}

export default function StockChart({ data, color = "green" }: StockChartProps) {
  const canvasRef = useRef<HTMLCanvasElement>(null)

  useEffect(() => {
    const canvas = canvasRef.current
    if (!canvas) return

    const ctx = canvas.getContext("2d")
    if (!ctx) return

    // Clear canvas
    ctx.clearRect(0, 0, canvas.width, canvas.height)

    // Set dimensions
    const width = canvas.width
    const height = canvas.height

    // Calculate scaling
    const max = Math.max(...data)
    const min = Math.min(...data)
    const range = max - min
    const xStep = width / (data.length - 1)

    // Draw line
    ctx.beginPath()
    ctx.strokeStyle = color === "green" ? "#22c55e" : "#ef4444"
    ctx.lineWidth = 2

    data.forEach((value, index) => {
      const x = index * xStep
      const y = height - ((value - min) / range) * height

      if (index === 0) {
        ctx.moveTo(x, y)
      } else {
        ctx.lineTo(x, y)
      }
    })

    ctx.stroke()

    // Fill area under the line
    ctx.lineTo(width, height)
    ctx.lineTo(0, height)
    ctx.closePath()

    const gradient = ctx.createLinearGradient(0, 0, 0, height)
    if (color === "green") {
      gradient.addColorStop(0, "rgba(34, 197, 94, 0.2)")
      gradient.addColorStop(1, "rgba(34, 197, 94, 0)")
    } else {
      gradient.addColorStop(0, "rgba(239, 68, 68, 0.2)")
      gradient.addColorStop(1, "rgba(239, 68, 68, 0)")
    }

    ctx.fillStyle = gradient
    ctx.fill()
  }, [data, color])

  return <canvas ref={canvasRef} width={100} height={50} className="w-full h-full" />
}

