pagecustomization "BSB Customer List" customizes "Customer List"
{
    layout
    {
        modify("Location Code") { Visible = false; }
    }
    actions
    {
        movebefore(NewSalesInvoice; NewSalesOrder)
    }
}