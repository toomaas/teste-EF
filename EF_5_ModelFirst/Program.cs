using System;

namespace EF_5_ModelFirst
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var db = new AccountingSystemContainer())
            {
                var invHeader = db.InvoiceHeaders.Create();
                var invDetail = db.InvoiceDetailSet.Create();

                invHeader.Total = 150m;

                invDetail.ItemDescription = "Some Item";
                invDetail.Price = 75m;
                invDetail.Quantity = 2;

                invHeader.InvoiceDetail.Add(invDetail);

                db.InvoiceHeaders.Add(invHeader);
                db.SaveChanges();
                var a = db.InvoiceHeaders;
                foreach (var c in db.InvoiceHeaders)
                {
                    Console.WriteLine(c.Total);
                }
                Console.ReadKey();

            }
        }
    }
}
