import { Request, Response, NextFunction } from 'express'

export default function authMiddleware(req: Request, res: Response, next: NextFunction) {
  const token = req.headers['authorization']

  if (token === `Bearer ${process.env.API_TOKEN}`) {
    return next()
  }

  return res.status(401).json({ error: 'Unauthorized' })
}
