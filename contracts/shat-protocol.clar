;; Title: ShatProtocol - Decentralized Social Protocol

;; Summary:
;; ShatProtocol is a decentralized social networking protocol built on Stacks,
;; leveraging Bitcoin's security and Stacks' smart contract capabilities.
;; It provides core functionality for user management, privacy controls,
;; and secure messaging with batched operations optimization.

;; Description:
;; This protocol implements advanced social networking features including:
;; - Secure user identity management
;; - Granular privacy controls
;; - Rate-limiting for network protection
;; - Batch processing for scalability
;; - Activity tracking and analytics
;; - Friend relationship management
;; All while maintaining compliance with Stacks Layer 2 standards
;; and Bitcoin's security model.

;; Error codes
(define-constant ERR_NOT_FOUND (err u100))
(define-constant ERR_ALREADY_EXISTS (err u101))
(define-constant ERR_UNAUTHORIZED (err u102))
(define-constant ERR_INVALID_INPUT (err u103))
(define-constant ERR_BLOCKED (err u104))
(define-constant ERR_DEACTIVATED (err u105))
(define-constant ERR_RATE_LIMITED (err u106))
(define-constant ERR_BATCH_FULL (err u107))
(define-constant ERR_BATCH_EXPIRED (err u108))

;; Status Constants
(define-constant STATUS_DEACTIVATED u0)
(define-constant STATUS_ACTIVE u1)
(define-constant STATUS_SUSPENDED u2)

;; Relationship Constants
(define-constant FRIENDSHIP_PENDING u0)
(define-constant FRIENDSHIP_ACTIVE u1)
(define-constant FRIENDSHIP_BLOCKED u2)
