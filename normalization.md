# Normalization Report for AirBnB Database Schema

## Objective

Ensure the database design adheres to normalization principles up to **Third Normal Form (3NF)**.

---

## Normalization Steps

### First Normal Form (1NF)
- All attributes hold atomic (indivisible) values.
- No repeating groups exist in any table.
- Each record is unique and identifiable by a primary key.

**Result:** ✅ Passed

---

### Second Normal Form (2NF)
- All non-key attributes are fully functionally dependent on the primary key.
- Tables do not contain partial dependencies.

**Result:** ✅ Passed  
Each table has a single-column primary key, so 2NF is achieved.

---

### Third Normal Form (3NF)
- No transitive dependencies between non-key attributes.
- All attributes are dependent only on the primary key.

**Result:** ✅ Passed  
All attributes are directly dependent on the table’s primary key and not on other non-key attributes.

---

## Summary

The schema is in full 3NF:
- No redundant data is stored.
- All relationships use foreign keys appropriately.
- Derived or repeated data is avoided.
- All business entities (users, bookings, payments, reviews, messages) are modeled separately.

**✅ No changes were necessary to reach 3NF.**
