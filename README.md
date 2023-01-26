# Breakout Trading Script for MetaTrader 5

This script is designed to implement a simple breakout trading strategy for use in the MetaTrader 5 platform. The script uses the `CTrade` class to manage trades and the `CPositionInfo` class to manage open positions.

## Usage

- Make sure you have the MetaTrader 5 platform installed and running.
- Open a chart for the symbol you wish to trade.
- Attach the script to the chart.
- Input the desired lot size for trading.
- The script will automatically detect breakouts and enter trades in the direction of the breakout.
- The script will also move the stop loss to the current high or low, depending on the direction of the trade.

## Inputs

- `Lots`: The lot size to be used for trading.

## Events

- `OnInit`: This event is called when the script is attached to a chart. It initializes the script and returns `INIT_SUCCEEDED`.
- `OnDeinit`: This event is called when the script is detached from a chart or when the platform is closed. It deinitializes the script.
- `OnTick`: This event is called when new tick data is received. The script uses this event to check for new breakouts and manage open positions.

## Notes

- The script uses the `iHigh` and `iLow` functions to get the current high and low prices, respectively, and the `SymbolInfoDouble` function to get the current bid price.
- The script only supports trading on one symbol at a time.
- The script uses a fixed lot size for all trades.

## Disclaimer

This script is intended for educational and informational purposes only. It is not intended to be a recommendation or advice for trading. The user should always conduct their own research and due diligence before making any trading decisions.
