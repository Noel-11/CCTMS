https://services.cagayandeoro.gov.ph/cctms/finance.asmx

functions:
1. getRequestPayment(controlNo,wskey) - get payment information
sample: https://services.cagayandeoro.gov.ph/cctmsws/finance.asmx/getRequestPayment?controlNo=202602B5AC&wskey=wsfinancecdo

2. updatePayment(controlNo,orNo,paymentMode,wskey) - update/post payment status as paid(Y)
valid paymentMode - walkin and online
sample: https://services.cagayandeoro.gov.ph/cctmsws/finance.asmx/updatePayment?controlNo=202602B5AC&orNo=12345&paymentMode=walkin&wskey=wsfinancecdo

3. cancelPayment(controlNo,wskey) - cancel certain paid payment by removing OR number and Paid Status (N)
sample: https://services.cagayandeoro.gov.ph/cctmsws/finance.asmx/cancelPayment?controlNo=202602B5AC&wskey=wsfinancecdo
    
Sample Control #: 202602B5AC
Current wskey: wsfinancecdo