import { Router } from 'express';
import authMiddleware from './middleware/auth';
import { getSubscriptionByEmail } from './models/subscription';

const router = Router();

router.get('/subscriptions/:email', authMiddleware, (req, res) => {
  const { email } = req.params as { email: string }
  const sub = getSubscriptionByEmail(email)

  if (!sub) {
    return res.status(404).json({ error: 'Subscription not found' })
  }

  res.json(sub)
})

router.get('/health', (_req, res) => {
  res.json({ status: 'ok' })
})

export default router;


