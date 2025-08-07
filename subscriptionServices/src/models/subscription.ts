export function getSubscriptionByEmail(email: string) {
  const subscriptions = [
    {
      id: 1,
      email: 'luffy@email.com',
      plan: 'Premium',
      status: 'active',
      startedAt: '2024-08-01',
      renewalDate: '2025-08-01',
      paymentMethod: 'credit_card'
    },
    {
      id: 2,
      email: 'zoro@email.com',
      plan: 'Basic',
      status: 'canceled',
      startedAt: '2023-03-15',
      renewalDate: null,
      paymentMethod: 'pix'
    },
    {
      id: 3,
      email: 'nami@email.com',
      plan: 'Basic',
      status: 'active',
      startedAt: '2022-01-31',
      renewalDate: '2026-01-31',
      paymentMethod: 'credit_card'
    }
  ]

  return subscriptions.find(sub => sub.email === email)
}