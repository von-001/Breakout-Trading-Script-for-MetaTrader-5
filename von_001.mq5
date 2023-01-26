#include <Trade/Trade.mqh>

CTrade order;

input double Lots = 1.1;
int lastbreackout = 0;

int OnInit()
{
   return INIT_SUCCEEDED;
}

void OnDeinit(const int reason)
{
   
}

void OnTick()
{
   double high = iHigh(_Symbol, PERIOD_CURRENT, 1);
   high = NormalizeDouble(high, _Digits);
   double low = iLow(_Symbol, PERIOD_CURRENT, 1);
   low = NormalizeDouble(low, _Digits);
   
   double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   
   if (lastbreackout <= 0 && bid > high)
   {
      Print(__FUNCTION__, "> buy signal...");
      lastbreackout = 1;
      order.Buy(Lots, _Symbol, 0, low);
   }
   else if (lastbreackout >= 0 && bid < low)
   {
      Print(__FUNCTION__, "> sell signal...");
      lastbreackout = -1;
      order.Sell(Lots, _Symbol, 0, high);
   }
   
   for (int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong posticket = PositionGetTicket(i);
      
      CPositionInfo pos;
      if (pos.SelectByTicket(posticket))
      {
         if (pos.PositionType() == POSITION_TYPE_BUY)
         {
            // Do something with long positions
            if(pos.StopLoss())
              {
               
               order.PositionModify(pos.Ticket(),low,pos.TakeProfit());
              }
         }
         else if (pos.PositionType() == POSITION_TYPE_SELL)
         {
            // Do something with short positions
            if(high < pos.StopLoss())
              {
               
               order.PositionModify(pos.Ticket(),high,pos.TakeProfit());
              }
         }
      }
   }
   
   Comment("\nhigh:", high, "\nlow:", low ,"\nbid:", bid);

}
