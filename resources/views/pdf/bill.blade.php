<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Invoice #{{ $appointment->id }}</title>
    <style>
        body { font-family: sans-serif; color: #333; }
        .header { text-align: center; }
        .table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .table th, .table td { border: 1px solid #ddd; padding: 8px; }
        .table th { background: #f4f4f4; }
    </style>
</head>
<body>
    <div class="header">
        <h2>Invoice - {{ $appointment->branch->name ?? 'Branch' }}</h2>
        <p>Date: {{ \Carbon\Carbon::parse($appointment->start_time)->format('d M Y, h:i A') }}</p>
    </div>

    <h3>Customer Details</h3>
    <p><strong>Name:</strong> {{ $appointment->customer_name }}</p>
    <p><strong>Phone:</strong> {{ $appointment->customer_phone }}</p>

    <h3>Services</h3>
    <table class="table">
        <thead>
            <tr><th>#</th><th>Service</th><th>Price</th></tr>
        </thead>
        <tbody>
            @foreach(json_decode($appointment->cart) as $index => $item)
                <tr>
                    <td>{{ $index + 1 }}</td>
                    <td>{{ $item->name ?? 'Service' }}</td>
                    <td>{{ number_format($item->price ?? 0, 2) }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

    <h3>Totals</h3>
    <p><strong>Item Total:</strong> ₹{{ number_format($appointment->item_total, 2) }}</p>
    <p><strong>Discount:</strong> ₹{{ number_format($appointment->bill_discount, 2) }}</p>
    <p><strong>Grand Total:</strong> ₹{{ number_format($appointment->grand_total, 2) }}</p>
</body>
</html>
